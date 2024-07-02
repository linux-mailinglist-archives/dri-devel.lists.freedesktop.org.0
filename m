Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD2E924A92
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50ED510E6E4;
	Tue,  2 Jul 2024 21:59:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FrDhDq4p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com
 [209.85.166.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0844010E6E6;
 Tue,  2 Jul 2024 21:59:07 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id
 ca18e2360f4ac-7f649f7868dso113933439f.2; 
 Tue, 02 Jul 2024 14:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957546; x=1720562346; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tTLQ7kYNablnENIf/KeDz5dGwor+/R9FnQHvwE/Et4=;
 b=FrDhDq4pexa0xNfuA2LEFm0bRsXzC9BeE9ce0dk86FXzqyLzi14xhTdfrQAAro0Uja
 SaymzteVhux0BOC762HhUNTfCYyajOO466NCwNrGgeNC7HG5WPm7YJHZFcBXaKgPJCQf
 2fIDNGqg4872pgerlbscFXEYRxUHx4WWnCxfxJVcKI82IUG1MUrZoLwgZt/7LGS9Am6/
 iEpUU4keVJ0vBR+aawdIqvm3Gww4I2g6N/QNCuplkf/WOycrCFSfIg1/5ahJ4rwzNkR7
 MOcLxRAthM7/vRkmU1pSODknH11GBi4e0om4mBaOieqrsc9wx0L1BlrwfqcsDjdL0axf
 2B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957546; x=1720562346;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tTLQ7kYNablnENIf/KeDz5dGwor+/R9FnQHvwE/Et4=;
 b=lf47A6fBUd7N6JJPnGUl+4a+TZzv3jPR4Qdv0K1osaMn3JT3xDJH5rsDDExNNehAYf
 jbK6wiOqUTk7r35V4QmKDrlEUbUojnA6UaaAdVYJb5you9be7q10ZmsMlJe3vvhmirJf
 fULNGhlxw4pmatisaFiQEbxR/GpyyoS0FxiiJcDWmUIF4vjnOgjqkqvaHCFF/a8UIlVK
 bON+W+bnqltkG2zhXpcS9zRCrTT3d2mYa8ppBkmntYih52fhcdNs+nxGHtImlChNcuoF
 03poHXtlzt5bSmkMKMjv6OfOeO6Yo2iSFhyM1paHFqkhU6sEwIhj1adk5KC6EiQAMYCQ
 C6Ew==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtLkt0f6+Aats8RBjL5JGG5d6wZEUCUSye4gaOWCCrmoW7KvGqNGdcyURqTzm6f+ckDtY/gylnihA7W3oyxdg7CVa4ZhHflZLJqWpeledx62eXc24bOQTKCQQmphsNNpNus8vu3UOk7uX3rGMykfwKmBIQ+OViVHea9HGloLTqhX0kUhfyS8Yoj/NKbJdfnPdXZngJb89/lx8NA/a4eGIkTqg+U66AS9GIecjjZ53XBI77bYE=
X-Gm-Message-State: AOJu0Yx85Yo4wBRbxwdsqf/8L7lLWoC1gRiST/c3uDbQtLs/ZKpKj4h8
 8eT9BmBmkBx30CoJlErL3kgEOH+SqeUd3eZF3/kYjJ9oiWoLe6V8
X-Google-Smtp-Source: AGHT+IHVzUq+7oBbjRhtfUg8hR7fA0Vm3TWdJRFj0erHJhGLHrI/NeeXyYjOwGHjAwtUEfGXKXA+rQ==
X-Received: by 2002:a5e:8f49:0:b0:7f6:1d7e:a9c9 with SMTP id
 ca18e2360f4ac-7f62ee085a0mr1058272839f.6.1719957546282; 
 Tue, 02 Jul 2024 14:59:06 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:05 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 38/52] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Tue,  2 Jul 2024 15:57:34 -0600
Message-ID: <20240702215804.2201271-45-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe uses
has drm.debug calls.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 87c10bd7958b..c61163d0d945 100644
--- a/drivers/gpu/drm/xe/xe_drm_client.c
+++ b/drivers/gpu/drm/xe/xe_drm_client.c
@@ -15,6 +15,8 @@
 #include "xe_drm_client.h"
 #include "xe_trace.h"
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 /**
  * xe_drm_client_alloc() - Allocate drm client
  * @void: No arg
-- 
2.45.2

