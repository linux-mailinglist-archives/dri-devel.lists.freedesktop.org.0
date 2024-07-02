Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF521924AB3
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431E410E722;
	Tue,  2 Jul 2024 21:59:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="VWGK2C8l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 180AA10E721;
 Tue,  2 Jul 2024 21:59:25 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id
 ca18e2360f4ac-7f3d3f1294dso169401139f.2; 
 Tue, 02 Jul 2024 14:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957564; x=1720562364; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wh8QJ3ROh21ShBzcCiOPzlcJgoRl8pzdhd6qJVNHlVY=;
 b=VWGK2C8l+IqLC1Ig5sX6NNwTpHCwK1LCSk4e+DnmqZO/sx2vwjFmXo+DN3SL+Ed5GR
 usrq9yMBEz6PiUerC7FtzlGDHk3vJytPV4e8qbK/qFOAlkREImm+B8z1z+OunAmLb+fX
 6Ki7OYNHW4w7aT3rZ+anShyweXfJxvwfodjT7Cx3EZKu2ocBTRoTCwv9+KMFK2oVzWbg
 N0QfF9yhS/4QnfjlfWzzNW7Uo5guAf1eLxES2rWX9384x1jhXVFYLsGcVHKdvv6qvSfb
 uvBx7Ss4O9EHfHJy8RdPZ40MSXp/fdvTsPTrTEDQTQ6HrW9oVK0jf8EPzmTbTJ0LOR6u
 p1hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957564; x=1720562364;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wh8QJ3ROh21ShBzcCiOPzlcJgoRl8pzdhd6qJVNHlVY=;
 b=IywNjV9ZF8qiZO3WohfMqMupGRhznooyVATUFCqTP1dQEvsfyyLd9rNhG0Sej0KCza
 FECQFFi7w9YwOf8O0plUCxVErSO62cf+jCBY/1BDeg4Jo1N+Z9k/+kkryBw85ntwkQZO
 KvJuB1LqZ4vki4xzDA/JAnZOtF8EwtqHToNROtDCPyYDXEO4cVHnK080f/mS61sG0CGi
 3Jmu9LYuymlpEK8fzKD2kZvBoudDMY4mj+a+So5dESGA6ASFL3ab4L9RpFTzJ7aVDtCn
 AnST/OUtqTWI1SREbck2hfOzBs8PSQmZinVcYoKCBtySOojOkljFSLoDO2pFpdt3pbp+
 8meA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVOpVSO/CX78jFWSjw++ahMwfsay2JU79qjMBin0aqW1WIBCZko51eZjdYkp6jwr4jD9ECbk0FjQfdrGQjZdTvQCT7zCN9hAJoXX3wf00SPmFkEV9PMEbC5tQSxINvZNE1rp1mFd/8/q/fm/4hiFojcbXEkoz7CIGEZs5APMs3HHlQ3Kc6hV6YqfJ2z6wTSiuXZRl0s9xvVOSzme5a732M+mTiHRBHJQozbsAqE0DmRECPBaMA=
X-Gm-Message-State: AOJu0Yyzas/JpPZZpZqwalmoRnFzrDYnazMItluhP1WfRn3/v+7qjoIn
 LfKraXI/HdFHHDLu5eFW0ayxJbb9quqfc2iIUGa9F7WkkE+TBowV
X-Google-Smtp-Source: AGHT+IGsvIlCZD+c570Neze+GHw9bZoFgMkgtz4aIrGReUzG3qZZPt9ry6B+lTwl9sdSHvOE1K8YBA==
X-Received: by 2002:a05:6602:304b:b0:7eb:8874:99e0 with SMTP id
 ca18e2360f4ac-7f62ee3a19amr1042539839f.12.1719957564338; 
 Tue, 02 Jul 2024 14:59:24 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:23 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 46/52] drm-dyndbg: add DRM_CLASSMAP_USE to vkms driver
Date: Tue,  2 Jul 2024 15:57:50 -0600
Message-ID: <20240702215804.2201271-61-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240702215804.2201271-1-jim.cromie@gmail.com>
References: <20240702215804.2201271-1-jim.cromie@gmail.com>
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

