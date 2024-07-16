Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9EF933156
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E7B510E87D;
	Tue, 16 Jul 2024 19:02:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZQPub2WI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F68E10E844;
 Tue, 16 Jul 2024 18:59:25 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id
 ca18e2360f4ac-7f97e794f34so4357039f.3; 
 Tue, 16 Jul 2024 11:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156364; x=1721761164; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh8QJ3ROh21ShBzcCiOPzlcJgoRl8pzdhd6qJVNHlVY=;
 b=ZQPub2WIwsQH+ZDvvlFWSGAiobg1oXqNiaJWgE3UPMEUKD4hhDhjLKkMvMjHD2OJVP
 ZFf3gH1BATE3sjO6mEupKEjUrrbuzTYfSMHWZdizi+xaIXxTaksDdwF8OkEii8wirxIP
 0d+yxwzY8gQo+87kkE2zndP35JUezj99QLQ4N7ADUiyTKp6lm3ezsJrNtJjcPYz+p1rA
 93H+Ey4ljOmhzVnp9+4N8lUo3Je+37Bg7sVnMtxdKGfxU5j2nqVUnuyLYEu9B9y2Ls7G
 feoXWdlJqCPSAic0WlFHOIPF/M8sHiuPsfueNyFb2Puk7dhFRduP2HCu0sdOtg5EC+FW
 6scg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156364; x=1721761164;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh8QJ3ROh21ShBzcCiOPzlcJgoRl8pzdhd6qJVNHlVY=;
 b=i5XCjE0YuSD0XJ7eazhG5ZEzjw3dCsxag6aSlu9nAdC/g93+/5pU/eRzgQpyaUDKtu
 jgacwfYvD35tImHTw2LHON/dIfhUFG2NLZGmHIt4CBBZIxrJyRZ+wC9r/5Euk+qUaAZG
 4dhHKT4ue1CGzBtHS4PwzIgpG4OpnYLMALIddthVVMwFrBGE7nzBDfQFIWEfYshFbVn7
 jrrclRmRnB9cLtrB6Sax59uh7rHuyt/C/jiTBS3LGXu1b74iTK7uNtlp/aNnHqr5mS1d
 KNoJXgPy//2GUlA7w2lrSQrLu8tKyjU7mwLN55T9Tpgs8Ynxw9f9JotZRBMnDnZKYZjJ
 DjcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUB8ByQF1GxhBM1mUzve2odeNu96T89Q+vVgytmZQqTFuoqceYrTlHOziDD2PpNQYTZQCdroIRiT3PY+RLQ4m4LtzM2JwaZUsYnaIl77pmM804XzS2TItu6zRKP7b9Ohura/HLa5HUKGACW6lp8rdkmIcXd43KvEO3eaK4208DXuJW6B7ClIIHCrtDQcoeaUaYde+Cn66/QabpzRj8Am/aS1ECcItGLZJkZN0pvulFs3gawP5w=
X-Gm-Message-State: AOJu0Yz6cDB/ZPcGQQgUy4bR9LaLeOxQLcDNFMNk1N1aLUaRDzrC68Dg
 w5hza+Nb2UPcMid4gTgmCYlzFg2Y8LGiFoh7IBU/DYsFfID6/R1f
X-Google-Smtp-Source: AGHT+IE7JSdS637yqmgSK0kAxgcum1cr1TH5x0rj6iYZ0/p71OMWMmUHkP3RXNMmv9mFZHhsjrkz/A==
X-Received: by 2002:a05:6602:1493:b0:807:4340:947e with SMTP id
 ca18e2360f4ac-816c4a15d70mr32398439f.15.1721156364251; 
 Tue, 16 Jul 2024 11:59:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:23 -0700 (PDT)
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
Subject: [PATCH v9-resend 46/54] drm-dyndbg: add DRM_CLASSMAP_USE to vkms
 driver
Date: Tue, 16 Jul 2024 12:57:58 -0600
Message-ID: <20240716185806.1572048-47-jim.cromie@gmail.com>
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

The vkms driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/vkms/vkms_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index dd0af086e7fa..086797c4b82b 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -39,6 +39,8 @@
 
 static struct vkms_config *default_config;
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 static bool enable_cursor = true;
 module_param_named(enable_cursor, enable_cursor, bool, 0444);
 MODULE_PARM_DESC(enable_cursor, "Enable/Disable cursor support");
-- 
2.45.2

