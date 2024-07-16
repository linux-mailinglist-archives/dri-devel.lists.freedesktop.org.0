Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F8933155
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A470210E87B;
	Tue, 16 Jul 2024 19:02:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kwz2S2PY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C293610E832;
 Tue, 16 Jul 2024 18:59:15 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-804ac219676so2496639f.0; 
 Tue, 16 Jul 2024 11:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156355; x=1721761155; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q0SsnMAz6GH/rDMkbSAQVrT9nuU+frPtroMw7DfrzhM=;
 b=kwz2S2PYBdIy4XhHWL1VrdsQdb9+1o4AmTWblYcP8WuBjliguWc9TJfnh782TQIiJO
 5tr1u2uSERYNherQsLjndyrcvB9oK7MjOF546CxL/k1hGXzpK0V+SJND0y+UHzZPOHV0
 c5DFKXRie03cT0J1MOggMpUHjNPdNg3Nzm26k4Kblk6NpmdJFMKhziCj5lb2JsetUghw
 sXg/RkKfPMqGQiNpAln6hToCp5AejDMk6BH7LasSQM6FCJWuSlCd5fdg9QdnBnT5F6s5
 DLAkByUU4DRtBOByVTlicd0giv0IhZ2PWL8SVAwuvQzKsLIfHLk9G7xdQhr5OTmJ+R+E
 duyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156355; x=1721761155;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q0SsnMAz6GH/rDMkbSAQVrT9nuU+frPtroMw7DfrzhM=;
 b=jeI49VL/1LkSryHfSKKYjc6n7Twjd1XaXnwxQd2DKiTfuTxqGzYZdRXXbdN2/ef5tu
 iC5HyMZT6YnIPrMQh5BexiRGw/fe+wE9bJxbnaXOsYpUIwNVMM8yvqgDXdRGW/aDHKP2
 2gps/KpYiopKpLv8hUvp4a5+KNalb2uUKEz1UCi7HQ1iK5/aZhcQUHrmjrMTq6kUVxAQ
 BtJrJBuOhU7wQ8kejgDpBA+YfXHVLQUlmJ9Ix3waY632v4QPFLt9EUFRGiP6PS0rsmU8
 1IJlWPfiOrUKSn7Y557GOcP5lNDFO2jftfeq4WiDcZnGcdepUbNNeaDDyQuN4Pk08mer
 mYIQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmqWt9OAgKhwCaao/yGq/wd4LBeDnaApClNZpR53PgMExpnSis8+P8FQogtw+NXPJmyudmWZuG4yUNmn1ic224xAGxTJdVV4HxbhAeve4HZC5v9Byc6YWNMnK0mFLkqrbO+8hzfFuzSplZcgLaEeonWkjzDNra/8WZbL9Ok7rDGev7JY1zW6n4ZJb1Zgr6mrIRrAruU8ZCFB2C76vWVDBY0XzQA+mcg9iW4OZ5WhH23PxkRIk=
X-Gm-Message-State: AOJu0YzcUTrEGpA5D6UkOfFoAfNay6jHbVy78d+/FdjMVjFtau0/z+4z
 FHoaps8G4r8WRtgL494LUT0e+1GbBC6xnLoH8DgWfJEeARNX6fZJ
X-Google-Smtp-Source: AGHT+IG4PMiQc6lo3f14z8Q6mtR1iYHrjoCgqtBhH8cIy0Dzz/zfd1kFjfu0oHviBWuod8DuEZ49Gw==
X-Received: by 2002:a5e:8b4d:0:b0:805:2048:a492 with SMTP id
 ca18e2360f4ac-816c4ee6d5amr23979539f.6.1721156355006; 
 Tue, 16 Jul 2024 11:59:15 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:14 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, daniel.vetter@ffwll.ch,
 tvrtko.ursulin@linux.intel.com, jani.nikula@intel.com,
 ville.syrjala@linux.intel.com
Cc: ukaszb@chromium.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, seanpaul@chromium.org, robdclark@gmail.com,
 groeck@google.com, yanivt@google.com, bleung@google.com,
 linux-doc@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, kernelnewbies@kernelnewbies.org,
 Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9-resend 39/54] drm-dyndbg: add DRM_CLASSMAP_USE to virtio_gpu
Date: Tue, 16 Jul 2024 12:57:51 -0600
Message-ID: <20240716185806.1572048-40-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240716185806.1572048-1-jim.cromie@gmail.com>
References: <20240716185806.1572048-1-jim.cromie@gmail.com>
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

virtio_gpu has 10 DRM_UT_CORE debugs, make them controllable when
CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg that the module has
class'd debugs.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/virtio/virtgpu_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 188e126383c2..d69d517de2a3 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -44,6 +44,8 @@ static const struct drm_driver driver;
 
 static int virtio_gpu_modeset = -1;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 MODULE_PARM_DESC(modeset, "Disable/Enable modesetting");
 module_param_named(modeset, virtio_gpu_modeset, int, 0400);
 
-- 
2.45.2

