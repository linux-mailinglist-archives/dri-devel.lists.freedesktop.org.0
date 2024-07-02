Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0851924AC2
	for <lists+dri-devel@lfdr.de>; Tue,  2 Jul 2024 23:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D4C10E720;
	Tue,  2 Jul 2024 21:59:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GkHr5eet";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67C0310E718;
 Tue,  2 Jul 2024 21:59:30 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id
 e9e14a558f8ab-376266a65c8so19419465ab.3; 
 Tue, 02 Jul 2024 14:59:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719957569; x=1720562369; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o0YsvOK5afJ8qV3rkuOU7CKX9HpGcds0hiKx8bDl++s=;
 b=GkHr5eet8CsEHIxtRWLzdBM41Cmu8UroKXDCnOajCSuLlSkpShYH7KnP5p9EXbEzIo
 XhkCQO05Mfj1xP/72k6wYbRzD/jiKuhVW5mGnzVM7YsLYFq8LGlJ1CgBCrdWLjOxyVgU
 hmdlTXUGLsyZAUmb3UGjSJWxoGK0GblV59d5fNhti//LBIqingBsMMtPtQ74z7YNJjB8
 /jrv3eTCmd2FKSFMwmRgp46xxCxdRaVsInwaRY2nuE3SvbuluywDMF4nPAoEJGt23ana
 vouiMcHDgwcvDWCHuf+xPB95ofQY2fIs4qiHSaUKxgx62R/GhJdii/W93KPyFGK6mecf
 ATxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719957569; x=1720562369;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o0YsvOK5afJ8qV3rkuOU7CKX9HpGcds0hiKx8bDl++s=;
 b=nq5FcU7lo6pkokuhPmxR9DUEJzWJG8lMbH4hka3qiKEUfmXbNFvAwy+6yiH4wj1UMX
 P1eWa67waeghHcsDieJa+HnArk+G1E0PS5mWcxqnmDU2mz+ghJLqWkGU4woRKFHbRGl5
 x85q/1ULT3boZzjQb6tW7pgVsWnrwaEuQorvIZMYipMy5YcGIUilbeZsLnCxG8u0DvXR
 zO0u2cl0qJ1LPpwp8zjt7Rhps9CXjBhQMtPZIFDP+aXu74wSv6WWF6q1kZyE7zCPu4D+
 F0SqP69wEiduIo9u18nULKfhBOqa10WQVBB+HjI0PtPDHGbpaUPtRAufbsSqOkuJivRu
 cBqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUeXWmMmWIAvZX5QAmAXrs0QNgY3mrMwmQVOHot+GNFHs5UkLADvsT/4+v20XgXRUCd25JnC/iIk/m3gDWyS3wx9tFH3wuWzXoPkyIs9Ny6Ja0lp8jwUbbNI1HhjiZurpENaw4AzCJ5HAf3LkdOqvlog1dm+W3j6uHQLgnqGed81qm57SYST+pAvVhml4PnDRPneRVuJyAA34sFxMLFcb1dvCfhP0I7KluoCvaME6dcUi+IlHI=
X-Gm-Message-State: AOJu0YxeAIN4IhpzEiPaWbHfmEK8DPKbwMkE1P4zqPqf2WF1PEioOJBI
 WJen9dXkCy6em3GNOgl8/aEr1txe+N4ZRUUv4aMLgFELJsluctj1
X-Google-Smtp-Source: AGHT+IERaSF1E7hyGHvqAXteBQDKZ2gIbvbhsAc5+kpyvD7v6UTlnyWFF6UFWiBkSylriwtIgT4LJw==
X-Received: by 2002:a6b:5103:0:b0:7f3:9bde:f44 with SMTP id
 ca18e2360f4ac-7f62ee6eaf5mr1109295239f.14.1719957569649; 
 Tue, 02 Jul 2024 14:59:29 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 ca18e2360f4ac-7f61d207fcesm279944739f.51.2024.07.02.14.59.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Jul 2024 14:59:29 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: daniel.vetter@ffwll.ch, tvrtko.ursulin@linux.intel.com,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com, jbaron@akamai.com,
 gregkh@linuxfoundation.org, ukaszb@chromium.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux@rasmusvillemoes.dk, joe@perches.com,
 mcgrof@kernel.org, Jim Cromie <jim.cromie@gmail.com>
Subject: [PATCH v9 48/53] drm-dyndbg: add DRM_CLASSMAP_USE to udl driver
Date: Tue,  2 Jul 2024 15:57:55 -0600
Message-ID: <20240702215804.2201271-66-jim.cromie@gmail.com>
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

The udl driver has a number of DRM_UT_* debugs, make them
controllable when CONFIG_DRM_USE_DYNAMIC_DEBUG=y by telling dyndbg
that the module uses them.

Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/udl/udl_main.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/udl/udl_main.c b/drivers/gpu/drm/udl/udl_main.c
index 3ebe2ce55dfd..ba57c14454e5 100644
--- a/drivers/gpu/drm/udl/udl_main.c
+++ b/drivers/gpu/drm/udl/udl_main.c
@@ -19,6 +19,8 @@
 
 #define NR_USB_REQUEST_CHANNEL 0x12
 
+DRM_CLASSMAP_USE(drm_debug_classes);
+
 #define MAX_TRANSFER (PAGE_SIZE*16 - BULK_SIZE)
 #define WRITES_IN_FLIGHT (20)
 #define MAX_VENDOR_DESCRIPTOR_SIZE 256
-- 
2.45.2

