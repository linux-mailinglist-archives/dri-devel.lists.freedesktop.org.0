Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A00877CE3DA
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 19:07:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947A210E44F;
	Wed, 18 Oct 2023 17:06:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7A910E41A;
 Wed, 18 Oct 2023 17:06:36 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7a2cc9ee64cso270762239f.1; 
 Wed, 18 Oct 2023 10:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1697648796; x=1698253596; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=JOrNYuncCNRB4EXA5RVzZn/TQSLTPza+ZahbfvuUf7s0Zg/tIOftIKGk4rE4neT/GR
 zQYPG8v/gv4K1GUr/rxLJ6VGzuRey8YR4ufdpiQHSHv8guGMqhDG3gIX/xy1eUxLzuxb
 xenl4zSH0E4ta3djNzuiJG+j4eYKjpEX4/ksj3+MqUqo7qLZvUQu9Sh9g01i5nuBoW3k
 c8jt6KNsb0WYNHuxdS/atu2PBeqYD8+qUZHZCM6VF/nN4Y0z/eNfQC1qSpjQrvMoLasl
 l6Zn3x72KATRcwKYBj1tNQCdTY4vOQy8TlvxcJNKzwEXmSrr2eOnSsfYcclSqB/cSTX2
 UNOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697648796; x=1698253596;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5LQP5MFDhA+xfUDGLuGe24GCmwsysAw7CRqOtSg8az8=;
 b=qL3KAk6RmUt4ip4m5sV4yiGFpLI18ZEHBA6d2wiOhym3UQuODwIMEup9KtQchLaQOn
 RdYXECh3X7Q9ffZ4jPpLUf7uQ1XzCSZqJiS1xbicfygPrzP4kq0xaXdbDo4B3DfO1MlQ
 pOCpThyxBhlYFfmp1wu0vUUzqrRTWHZ1iNdwCjCTpzuOhfrZrzKSq1x3JyMHr/k72OJJ
 YdLt55Wp3UX1NfqUQPSAuochNxq6caYuSBHzDDm13yz06ZB+ZUjAC5Hxs3fDHZYJc2JO
 vJFvgFXjzqT1llUNJOamiZAnglN3F7vOzSf8WCSbdaMJ7TT0Q4YWA2R/yRsz5xI4nwu1
 AcHA==
X-Gm-Message-State: AOJu0Yw3CSupb/wHhpN3wDbXlq75KoCo7BwhCNf0OwtnjyyFX9slqJWV
 QmiCmGLaKEYEVghZ0yvKQp0=
X-Google-Smtp-Source: AGHT+IEc4mOF8fsJ6PP9Q0I6owI0pWzjQPyiy/8zqDoyKE5tRBFWh3/xkkNAKOARyTu4me/pvUabfg==
X-Received: by 2002:a05:6602:2e0f:b0:792:70c2:9db1 with SMTP id
 o15-20020a0566022e0f00b0079270c29db1mr5926401iow.1.1697648795893; 
 Wed, 18 Oct 2023 10:06:35 -0700 (PDT)
Received: from frodo.. (c-73-78-62-130.hsd1.co.comcast.net. [73.78.62.130])
 by smtp.googlemail.com with ESMTPSA id
 n4-20020a5d8244000000b0079fa1a7cd36sm1228944ioo.30.2023.10.18.10.06.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Oct 2023 10:06:35 -0700 (PDT)
From: Jim Cromie <jim.cromie@gmail.com>
To: linux-kernel@vger.kernel.org, jbaron@akamai.com,
 gregkh@linuxfoundation.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: [PATCH v7c 22/24] drm: use correct ccflags-y spelling
Date: Wed, 18 Oct 2023 11:06:02 -0600
Message-ID: <20231018170604.569042-23-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231018170604.569042-1-jim.cromie@gmail.com>
References: <20231018170604.569042-1-jim.cromie@gmail.com>
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
Cc: lb@semihalf.com, groeck@google.com, linux-doc@vger.kernel.org,
 jani.nikula@intel.com, daniel.vetter@ffwll.ch, linux@rasmusvillemoes.dk,
 rostedt@goodmis.org, mcgrof@kernel.org, seanpaul@chromium.org, joe@perches.com,
 bleung@google.com, yanivt@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Incorrectly spelled CFLAGS- failed to add -DDYNAMIC_DEBUG_MODULE,
which broke builds with:

CONFIG_DRM_USE_DYNAMIC_DEBUG=y
CONFIG_DYNAMIC_DEBUG_CORE=y
CONFIG_DYNAMIC_DEBUG=n

Also add subdir-ccflags so that all drivers pick up the addition.

Fixes: 84ec67288c10 ("drm_print: wrap drm_*_dbg in dyndbg descriptor factory macro")
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 drivers/gpu/drm/Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..22b1984cc982 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -3,7 +3,8 @@
 # Makefile for the drm device driver.  This driver provides support for the
 # Direct Rendering Infrastructure (DRI) in XFree86 4.1.0 and higher.
 
-CFLAGS-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
+ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)		+= -DDYNAMIC_DEBUG_MODULE
+subdir-ccflags-$(CONFIG_DRM_USE_DYNAMIC_DEBUG)	+= -DDYNAMIC_DEBUG_MODULE
 
 drm-y := \
 	drm_aperture.o \
-- 
2.41.0

