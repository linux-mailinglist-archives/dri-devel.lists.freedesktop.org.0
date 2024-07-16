Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F46B93313D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:01:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3B1A10E869;
	Tue, 16 Jul 2024 19:01:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="bc5St8RB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1CA210E851;
 Tue, 16 Jul 2024 18:59:29 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7fb93b2e2a3so4708539f.1; 
 Tue, 16 Jul 2024 11:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156369; x=1721761169; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3JTbEivvcQUwAcXrAriYcuJGP77J1qAidh1sZIrKRVg=;
 b=bc5St8RB8xqnl3ER1XRjDv7ZSkDW9jhv6udCD/C7oFXvP3uZuXGITU93VzSUD4QuT5
 opszjD/3VfBGRsL5YqM+AMUUF1V+GSdYt0LD3XhVUeR+FwNs8XFM7pxCcEIEoAS08Tcf
 cerHs2PxhH5UshqUvdBIe9cwe67HXPP05rsSdzYAQlVTVidVyFVlL98pMzEEmCTU9b1w
 n0ue3Z8BC77jpuDsbwDIE2XkCWUDiz79ZU+Q29EXL0crCZmJUeG0kQHQZog6sO6Xh+oW
 N3c1lxeGZsh10QA0QoS4rzsEWAQLNm781wAdbIPHArB2+rFxJurQPnWlYQrfy9ec6ap6
 PsIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156369; x=1721761169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3JTbEivvcQUwAcXrAriYcuJGP77J1qAidh1sZIrKRVg=;
 b=auaUCjSbiylbftlRJX1RqKnnSWI1/X3pTeFU5K0FkIH9oS7CHpL51Dp4S8B6kfCbC1
 pKg6Z7Ozh1hAnqHbLoKlIVCrDkcCsRpXHoXAcg8K+BaqGj61fCdx+djzA559j660u4UB
 jjBCIKGxd3E72yXx5mjvo2SQlF6LU5AVHqvvCIQYQuHFum+yHiEzBhBjSYGaBFGOPI+D
 JH8Fdr1N0CubaLuuTK7qnmGpkVGshbrWM79dA08/Z0NZt2cq+5J8ppRy+blZEqmZjnTf
 YYbTCsENrTilJXPc8iskwkfkuhyqUMOHHdjy8Gr2h2LnYJhRuv0xhigAFpLIE6PeVh1F
 AGyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUV1BkpJR89v0E0weh8k5k687JezMIUKm9Y1F7qzgxhDZZGOmj/1pA3/DnUF82rsN9Zfja4kI32+SFZBvWjmHFcSaiW8+/C2RZwj8p+ClmzDwZ6nmsw7kJTQC7Va/BwSVvLTAiaJeMkrTSANcN7zblyqx64C1yWJZbMrgPdLkYAT/D29UscSfpmVJfq6ULrfqXjfHy6LmStZpEr3YnJYXoibhOgpnN2VU+HC5wxoQ64YDbfml0=
X-Gm-Message-State: AOJu0YzC4Nl/trb7k9HrRpSrCBfwwWPUZ1foloVpoce+O9oSursWQ6RK
 4gvEz2QwLZMZ8lnsKA9BXtUseXeu6/Wy9MexTIfuxh7QqKaoTY+u
X-Google-Smtp-Source: AGHT+IGARWh4QxiG+Icc635bMvQOuQFO/eTfpUh5U7VRGb1JDZZ9GA0bt8iTtTyAJOTCk1Gv5ICnMQ==
X-Received: by 2002:a05:6602:6d0e:b0:80f:81f5:b496 with SMTP id
 ca18e2360f4ac-816c4a16988mr40830239f.14.1721156369258; 
 Tue, 16 Jul 2024 11:59:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:28 -0700 (PDT)
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
Subject: [PATCH v9-resend 50/54] drm-dyndbg: add DRM_CLASSMAP_USE to the qxl
 driver
Date: Tue, 16 Jul 2024 12:58:02 -0600
Message-ID: <20240716185806.1572048-51-jim.cromie@gmail.com>
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

The qxl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/qxl/qxl_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index beee5563031a..1971bfa8a8a6 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -65,6 +65,8 @@ module_param_named(modeset, qxl_modeset, int, 0400);
 MODULE_PARM_DESC(num_heads, "Number of virtual crtcs to expose (default 4)");
 module_param_named(num_heads, qxl_num_crtc, int, 0400);
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static struct drm_driver qxl_driver;
 static struct pci_driver qxl_pci_driver;
 
-- 
2.45.2

