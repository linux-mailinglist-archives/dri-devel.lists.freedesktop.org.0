Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24064924A97
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87A6810E6F2;
	Tue,  2 Jul 2024 21:59:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="R1hrGbSJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com
 [209.85.166.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA0510E6F2;
 Tue,  2 Jul 2024 21:59:10 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id
 ca18e2360f4ac-7eb5dd9f994so174432139f.2; 
 Tue, 02 Jul 2024 14:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957549; x=1720562349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0tTLQ7kYNablnENIf/KeDz5dGwor+/R9FnQHvwE/Et4=;
 b=R1hrGbSJDOgO+LXq2CgpDjhGMsO59CdfgMETPNk+KkSKyzw+AMSY/Wr50Yx/h/lxcQ
 /wLrxo3c4kq40DBz5n+SdRpEJi2QEtiMNVd4CLEjd6cnrCxCXhvKXigUrkvYdRWNEyrj
 i0OD62Nk/u8RarHAxfA0zrTH2C54NvDneydCwjDNlnVUAlXuaqbkGpbTTG/OPtsQ4v6Z
 xHD2eoSE6XtrGTjZE6hU/WQVdi7ACITAqcEhL6DmQJWg/yzRaM3pE3YhFdL8db8/V/UW
 8KgSstmBne7yxTomxwOr3YrnFWl3AxXvJDDB2ZCd07ojfhM1zgNILSuw0VNwrkKOZz+Y
 sKtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957549; x=1720562349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0tTLQ7kYNablnENIf/KeDz5dGwor+/R9FnQHvwE/Et4=;
 b=FEHlLOl9lcPdzwOiJIQP+JiZxnK/kkpY7qlrI26FkUyNlc3R5vpPyfRmDbcJ2H1R6D
 oLyX8D0w+O4BA2dr2keMzOcdCBrU/IikoZ1U5scMIVM36QjycjkYKgTxY/U6X7/etjhq
 V8qF/I6EBZKnlMTQ4FMDd49HnyE1/CI+mg//L6x52pUejI7PYHY5SEYRA9tJ0K3TgPHo
 Cm3M90vmank/I6gd/DfUzH22fvYYmPVDXzrul5cdYVqOLmMER8U96g6bSWixfAaaqa1f
 0hpxeF2eCFGOFK0+4eDzdt3DI7L59KrKD21+73vbBV9Ap0TgSnPDdkFn9Th2L6jiLRrL
 J/pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdMLS0WYwgCgxPqLWnj1CJePm73tjBar9WWIfki8Y5GJYT426QKXay0Gq7y5/HupAb5jd6PlY5AUCKlgDHcJ3pzHSG/uFLQeKsMPomK8v5s8JNNw4RUXbStQ+VhTog7IeYV4TXG+5QG5BFDftn3+YXAmO4bLmOAV7pct/b1C6aBcY4jh5NNulL/0RYrzsPnooByL5I7Bb4VtfyPVu9V4Fo5dZELwI9y4wa0WQ6M6drMOZdos0=
X-Gm-Message-State: AOJu0YxnYpB7tOY6FAHcwsVB0ShvuNS586ebgnoYDQgPMpcAqCQpa+zk
 gQpi5NGfi7q5AmJAcgucu7U6mNO3LqIEGhuIyrFbGVAENBqtIkuJy0eanA==
X-Google-Smtp-Source: AGHT+IE2I+kZLU2rS/pXH2LWHejqkkSB+OxH8ZpJWiyY2BdB6lV2bIk60uhOaSqkSLWh+0iOsTHn/w==
X-Received: by 2002:a05:6602:1651:b0:7f6:51ac:bba9 with SMTP id
 ca18e2360f4ac-7f651acbd92mr409692939f.10.1719957549276; 
 Tue, 02 Jul 2024 14:59:09 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:08 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 39/53] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Tue,  2 Jul 2024 15:57:37 -0600
Message-ID: <20240702215804.2201271-48-jim.cromie@gmail.com>
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

