Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF223933112
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2024 21:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EE3810E864;
	Tue, 16 Jul 2024 19:00:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RmaAW23X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9094910E841;
 Tue, 16 Jul 2024 18:59:14 +0000 (UTC)
Received: by mail-io1-f42.google.com with SMTP id
 ca18e2360f4ac-816ca307407so4163939f.2; 
 Tue, 16 Jul 2024 11:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721156354; x=1721761154; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Js70Xgv7tO+TEiqyDegu3yGlviUzyyQPsaTm0/0JTcY=;
 b=RmaAW23XE5fOULnjZEVXtFn6TY2gCDsXa9jdzEY/gUhxO2T29tlYF4lZPNgPTULYSn
 9g5OkuIp6jlL35aIrZVUl5Wn7zAESFuo5q0fCpYAR3eTXmf5qrJhQUlUyB5b8pVCTQFi
 lbuqptJszGsuVLLfXUrYIRFd7+REEVS5Ng982E+XK94CU5CCityn+duDTZbbuFWlswih
 eJ2x9/PZ7jCRc/PbexhcI4WMTwegK3xKCGgMDA5nPk7qh1jqtcFy4J9EgFhHh6OVbY3A
 T1iVouCjTO3SLZ6vFumnUkE2mznAqI1O5+qUctdwMhhNVwjEcumvusqo1TGNeQty9GyW
 XjIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721156354; x=1721761154;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Js70Xgv7tO+TEiqyDegu3yGlviUzyyQPsaTm0/0JTcY=;
 b=PdNnjbl/N3jmNQ8e5jy2dZMQ609yBDudtzQs+eoERO+yIArQ4oV9K1MDV5QbDCu5rm
 NpvlzDNXUO+3BbFdUFWpn1d8TXsBZS4FHA2mq7E6EwYx6O9Emk9wflcl5qwB/Gb6GZAS
 pZoryAQA8tENnUgfzEJhZT2jGjEvD3Qlijsi8UyKrGjS9B00Yo2mSwKK3ih423fYGHvE
 e6y1/wqjMlEgnPBGSXefYXyPWNeNzKu8E4aHfrnb6V0N3iaOdzTu8hhWcqSts6/dvf+W
 Vsu//xNrCUgzOY34ityeu/Cw/Qb6eTn9NM4rUeGsjL8PabQpVHsGHLTDzNEAPMT2as5X
 kdZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVr4Km7Gwu5Azf4pgWZEsRmmEkXLHdk8lPtdL7iBKTOnH8xz2GGEw4ysqRU7PxHN1mBzrZgl/fRkcKxZe8ZUt8DxB4oZsrtcpG3rUy0tiz2z9DupfJlE442mq7fXkarRnYlxzVprg/Y8fTvHHGwOefvJk93wx+dyazBtB5GX4snk3DIj8UPfYjLiNBX/zRyH+ni0iP+VNqcGfMuM2vRNFzcEdWEQodPJnmpsipQWvuDSses+3I=
X-Gm-Message-State: AOJu0YwZd+QUlZcgROjBagesec6iHFhGPYvis1qsyeHq2Jgb4mPGTE1n
 MuBeQne6EkjjzTaJDMcZwGxeNAeXbVHJgpNHEwdw2yYgCihtRH9b
X-Google-Smtp-Source: AGHT+IEAAxHzBu/3CUMwZXKcGeHVjTG9/MciUgkGKMQnclLMbDsGFn2sctNnI8XkLFXsXcs8f15EyQ==
X-Received: by 2002:a05:6602:2c91:b0:807:f0fb:1192 with SMTP id
 ca18e2360f4ac-816c4071593mr42423439f.1.1721156353753; 
 Tue, 16 Jul 2024 11:59:13 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 8926c6da1cb9f-4c210f23f1csm75301173.102.2024.07.16.11.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jul 2024 11:59:13 -0700 (PDT)
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
Subject: [PATCH v9-resend 38/54] drm-dyndbg: add DRM_CLASSMAP_USE to Xe driver
Date: Tue, 16 Jul 2024 12:57:50 -0600
Message-ID: <20240716185806.1572048-39-jim.cromie@gmail.com>
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

Invoke DRM_CLASSMAP_USE from xe_drm_client.c.  When built with
CONFIG_DRM_USE_DYNAMIC_DEBUG=y, this tells dydnbg that Xe uses
has drm.debug calls.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/xe/xe_drm_client.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
index 08f0b7c95901..ffd6e237f3c6 100644
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

