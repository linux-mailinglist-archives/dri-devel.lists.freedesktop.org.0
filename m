Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA2FA79460
	for <lists+dri-devel@lfdr.de>; Wed,  2 Apr 2025 19:43:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6B0010E896;
	Wed,  2 Apr 2025 17:43:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="arBgeyjw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com
 [209.85.166.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6C110E8B2;
 Wed,  2 Apr 2025 17:43:05 +0000 (UTC)
Received: by mail-il1-f174.google.com with SMTP id
 e9e14a558f8ab-3d45875d440so608545ab.0; 
 Wed, 02 Apr 2025 10:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1743615784; x=1744220584; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=riXSD1tORrHtkttiQwAlqFF38I5b7O133kwF8VYREw8=;
 b=arBgeyjwh3Xd2brJrK0Zxc/2GKikXZFueGFq0tQhWLZWiJ/6svTm2JErWpl8r+fL7c
 kZU63yn0pLRPg98vrll0IHzerbuYv2//0xkumL6UV1xO1hFIWKWuedbxtZB5fe4JQvpU
 Nn4FpsUfFgwxiETnCGBMQ4u+Glhr1M8i4o1OvCW58N9/SI4dsa5gcE54JfYkzvCXCAF/
 iwY6Yqkc4UYGTZTB69M9eQn7wLcdtHV9vjXr5+aYNuy+imYEQAI7mCmFUC4bt4g6Z+8Z
 F42M2LDfR3bpm8ZFxpoE4FxqCqHIb+SVwWny0mdH13l+BJuDD4uMro4WmuxczIjOOc7F
 xNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1743615784; x=1744220584;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=riXSD1tORrHtkttiQwAlqFF38I5b7O133kwF8VYREw8=;
 b=wZWGRWA1JnLbNXdCI6UDnDtPro6CuZm0QcvpxhcTz6SGhcn7q6lzMJnBNCGzVq+Kkd
 bwTwa/uXMNJN3lbwRbrUT7DfQKYZxTONAJ3aB5++5NPZ0lcszoxg6dSsvZe9JDZXl8S4
 Xj9aXKu9wwAXCeyMgrFsA+9a/A3EwGzSx5WsJyn4BWdPRiAjCqgOwDPLyRs7lVdxDT6r
 +9Xqqnrdg/MOqObUl88zApfRs/IWacjhAWCSpF5oyvdksMAARexGZBykf9dya9ZoEPrX
 59kAfe8m9JYzpbQbW888EVF0mDM7QGgop+4a5189ba6yp3mYQZrmPWCSQiVnwRDewXWA
 tV7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVkVYdLM/a7sBnPe0oSukOXsMtwnpj2ZQqmhbTGpYmf/w4+LYnU+a5u+1hX0nmNRADkB1xWQZwI@lists.freedesktop.org,
 AJvYcCWfLAVedfxFHbjK/nF6GhCZw3VNW6I1GCLbV3WJp1rR0l7TynntcrIPx6s74Omz9LHsPopsK/5p8NhA@lists.freedesktop.org,
 AJvYcCX5jZixBHtNqI7iXHPHXe0MiTkqlW9hmIGvQ7kFAyhvmiznmPjXOPHpHU5DRkHs2be50ObQ3OIArRVvLlQLsQ==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVzalFGGOCBsKEhjJfvXeRt+GT3de0hQS8+hKVyhbn7w0x0T6i
 O++wxzPqIamtUbCeZXnitzZ2IgRqGaZD/pdp7hNAJRpmc/MJTGt+
X-Gm-Gg: ASbGnctKgLzQg5J7OU/oqE5zt/ynPia1mLGvylr+J4ah8/5Xmk6H6iEXfhExHj+zhqv
 Xr3h9+PdUy/tNhwh4TjRIaIuidr4qMYx550BXdKFrMxmcrozAbtVLWXq+rlsnJyn+B6XJlKS81h
 tLsapZutU6Ylb+d9cAlEMrI2OUtc4boX50Fzb3T/YZUYt4KdZ2rP3cRSgs+tQElT9xa7Vlqjw1p
 2whOOvA1u8NhfB4hhNKfFLLYOZLxdTnoRlgonU7fyDLLC0eZYVLqpatlEkGHX6gzPidKzjpmOAh
 5MwdZmd/rTNFtZ3Af4qvUmmORbDfcQyX4tJNf34kQs6fl/rIeRxm7OHaFn5jpao7aYn4HAK2J+b
 STw==
X-Google-Smtp-Source: AGHT+IEbSBP+B3xptDWbc/1upPiI0aJgKHmWB2BUQakR8KahNUKIycomB71fjze7DtGkXTxHa/MFtA==
X-Received: by 2002:a05:6e02:2612:b0:3d4:3d63:e070 with SMTP id
 e9e14a558f8ab-3d5e09d9fb0mr177162865ab.16.1743615784292; 
 Wed, 02 Apr 2025 10:43:04 -0700 (PDT)
Received: from gandalf.. (c-67-165-245-5.hsd1.co.comcast.net. [67.165.245.5])
 by smtp.googlemail.com with ESMTPSA id
 e9e14a558f8ab-3d5d5af8369sm33439725ab.71.2025.04.02.10.43.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Apr 2025 10:43:03 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: jbaron@akamai.com, gregkh@linuxfoundation.org, ukaszb@chromium.org,
 louis.chauvet@bootlin.com, linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gvt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v3 52/54] drm-dyndbg: add DRM_CLASSMAP_USE to the
 drm_gem_shmem_helper driver
Date: Wed,  2 Apr 2025 11:41:54 -0600
Message-ID: <20250402174156.1246171-53-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250402174156.1246171-1-jim.cromie@gmail.com>
References: <20250402174156.1246171-1-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The drm_gem_shmem_helper driver has a number of DRM_UT_* debugs, make
them controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling
dyndbg that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 5ab351409312..481d18561688 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -23,6 +23,7 @@
 #include <drm/drm_print.h>
 
 MODULE_IMPORT_NS("DMA_BUF");
+DRM_CLASSMAP_USE(drm_debug_classes);
 
 /**
  * DOC: overview
-- 
2.49.0

